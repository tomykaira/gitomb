# -*- coding: utf-8 -*-
#
# @file repository_handler
# @brief 登録された git リポジトリを一次保存、ダウンロード、登録する
# @author tomykaira
# @date   2012/02/09

require 'milkode/common/dbdir'

module Milkode
  module RepositoryHandler
    GIT_DIR = Dbdir.default_dir + '/git_repos'

    class << self
      def append(repo)
        Thread.new do
          puts "Thread started: #{ repo }"
          puts `milk add #{repo}`
        end
      end

      def update_all
        Thread.new do
          puts "Thread started: update"
          puts `milk update --all`
        end
      end
    end
  end
end
