class RelationsController < ApplicationController
  def index
  	# @synmCnt = Relation.find_by_sql("select count(rel_id) from relations where syn_ant_cd=1 and rel_id=(select rel_id from relations where word_id=?)", @word.id)
  	# render '/lessons/home'
  end
end
