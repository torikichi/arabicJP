class RelationsController < ApplicationController
  before_action :require_login, only: [:add_synonym, :edit, :update, :new, :create, :edit_antonym, :entry_antonym]

  # 類義語検索	
  def synonym
    @words = Word.get_synonyms(params[:id], 1)

    @words = Kaminari.paginate_array(@words).page(params[:page])
  	render '/lessons/home'
  end

  # 対義語検索
  def antonym
    @words = Word.get_antonyms(params[:id], params[:ant_contrast_cd])

    @words = Kaminari.paginate_array(@words).page(params[:page])
  	render '/lessons/home'
  end

  def add_synonym
    @relations = Relation.find_by_sql(["select r.*, w.word as word, w.pos as pos, w.meaning as meaning from relations r left outer join words w on r.word_id=w.id where w.word=? and r.syn_ant_cd=?", params[:srchSyn], params[:id]])

    case params[:id]
    when "1"
      render '/relations/synsub'
    when "2"
      render '/relations/antosub'
    end
  end

  def edit
    @relations = Relation.where("word_id=?", params[:id])
    @relation = Relation.new
  end

  def update
    @relation = Relation.new(relation_params)

    if @relation.save
      flash[:success] = "新たな類義語を登録しました。"
      redirect_to action: 'edit', id: @relation.word_id
    else
      render 'edit'
    end
  end

  def new
    @relation = Relation.new
  end

  def create
    @relation = Relation.new(relation_params)

    if @relation.save
      flash[:success] = "新たな類義語を登録しました。"
      redirect_to action: 'edit', id: @relation.word_id
    else
      @relations = Relation.where("word_id=?", @relation.word_id)
      render :action => "edit", :controller => "relations", :id => @relation.word_id
    end
  end

  def edit_antonym
    @relations = Relation.where("word_id=?", params[:id])
    @relation = Relation.new
  end

  def entry_antonym
    @relation = Relation.new(relation_params)
    # 反対の意味を持つ語が指定されてくるため、対比コードを入れ替える
    case @relation.ant_contrast_cd
    when 0
      @relation.ant_contrast_cd = 1
    when 1
      @relation.ant_contrast_cd = 0
    else
      flash.now[:danger] = "対義語を指定してください。"
      render 'edit_antonym'
      return
    end

    if @relation.save
      flash[:success] = "新たな対義語を登録しました。"
      redirect_to action: 'edit_antonym', id: @relation.word_id
    else
      @relations = Relation.where("word_id=?", @relation.word_id)
      render :action => "edit_antonym", :controller => "relations", :id => @relation.word_id
    end

  end

  # 類義語サブウィンドウOPEN
  def synsub
    
  end

  # 対義語サブウィンドウOPEN
  def antosub
    
  end

  private
    def relation_params
      params.require(:relation).permit(:rel_id, :word_id, :syn_ant_cd, :ant_contrast_cd, :type_name)
    end
end
