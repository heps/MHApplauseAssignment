//
//  MHApplauseAssignmentTests.swift
//  MHApplauseAssignmentTests
//
//  Created by Maciej Hepner on 24/04/2019.
//  Copyright © 2019 Maciej Hepner. All rights reserved.
//

import XCTest
@testable import MHApplauseAssignment

class MHApplauseAssignmentTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
		
    }

	func testDownloadingRepositories() {
		let url = URL(string: "https://api.github.com/users/applauseoss/repos")!
		let expectation = self.expectation(description: "repositories downloaded")
		let task = URLSession.shared.repositoriesTask(with: url) { repositories, response, error in
			if repositories != nil {
				expectation.fulfill()
			}
		}
		task.resume()
		
		waitForExpectations(timeout: 5, handler: nil)
	}
	
	func testParsingData() {
		let data = "[{\"id\":90988789,\"node_id\":\"MDEwOlJlcG9zaXRvcnk5MDk4ODc4OQ==\",\"name\":\"ConsumerGraph\",\"full_name\":\"ApplauseOSS/ConsumerGraph\",\"private\":false,\"owner\":{\"login\":\"ApplauseOSS\",\"id\":20522207,\"node_id\":\"MDEyOk9yZ2FuaXphdGlvbjIwNTIyMjA3\",\"avatar_url\":\"https://avatars1.githubusercontent.com/u/20522207?v=4\",\"gravatar_id\":\"\",\"url\":\"https://api.github.com/users/ApplauseOSS\",\"html_url\":\"https://github.com/ApplauseOSS\",\"followers_url\":\"https://api.github.com/users/ApplauseOSS/followers\",\"following_url\":\"https://api.github.com/users/ApplauseOSS/following{/other_user}\",\"gists_url\":\"https://api.github.com/users/ApplauseOSS/gists{/gist_id}\",\"starred_url\":\"https://api.github.com/users/ApplauseOSS/starred{/owner}{/repo}\",\"subscriptions_url\":\"https://api.github.com/users/ApplauseOSS/subscriptions\",\"organizations_url\":\"https://api.github.com/users/ApplauseOSS/orgs\",\"repos_url\":\"https://api.github.com/users/ApplauseOSS/repos\",\"events_url\":\"https://api.github.com/users/ApplauseOSS/events{/privacy}\",\"received_events_url\":\"https://api.github.com/users/ApplauseOSS/received_events\",\"type\":\"Organization\",\"site_admin\":false},\"html_url\":\"https://github.com/ApplauseOSS/ConsumerGraph\",\"description\":\"Kafka Topic -> Consumer map\",\"fork\":false,\"url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph\",\"forks_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/forks\",\"keys_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/keys{/key_id}\",\"collaborators_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/collaborators{/collaborator}\",\"teams_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/teams\",\"hooks_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/hooks\",\"issue_events_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/issues/events{/number}\",\"events_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/events\",\"assignees_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/assignees{/user}\",\"branches_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/branches{/branch}\",\"tags_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/tags\",\"blobs_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/git/blobs{/sha}\",\"git_tags_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/git/tags{/sha}\",\"git_refs_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/git/refs{/sha}\",\"trees_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/git/trees{/sha}\",\"statuses_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/statuses/{sha}\",\"languages_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/languages\",\"stargazers_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/stargazers\",\"contributors_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/contributors\",\"subscribers_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/subscribers\",\"subscription_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/subscription\",\"commits_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/commits{/sha}\",\"git_commits_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/git/commits{/sha}\",\"comments_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/comments{/number}\",\"issue_comment_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/issues/comments{/number}\",\"contents_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/contents/{+path}\",\"compare_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/compare/{base}...{head}\",\"merges_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/merges\",\"archive_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/{archive_format}{/ref}\",\"downloads_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/downloads\",\"issues_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/issues{/number}\",\"pulls_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/pulls{/number}\",\"milestones_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/milestones{/number}\",\"notifications_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/notifications{?since,all,participating}\",\"labels_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/labels{/name}\",\"releases_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/releases{/id}\",\"deployments_url\":\"https://api.github.com/repos/ApplauseOSS/ConsumerGraph/deployments\",\"created_at\":\"2017-05-11T14:31:02Z\",\"updated_at\":\"2019-01-20T03:28:46Z\",\"pushed_at\":\"2018-11-01T21:32:16Z\",\"git_url\":\"git://github.com/ApplauseOSS/ConsumerGraph.git\",\"ssh_url\":\"git@github.com:ApplauseOSS/ConsumerGraph.git\",\"clone_url\":\"https://github.com/ApplauseOSS/ConsumerGraph.git\",\"svn_url\":\"https://github.com/ApplauseOSS/ConsumerGraph\",\"homepage\":\"\",\"size\":72,\"stargazers_count\":7,\"watchers_count\":7,\"language\":\"Java\",\"has_issues\":true,\"has_projects\":true,\"has_downloads\":true,\"has_wiki\":true,\"has_pages\":false,\"forks_count\":2,\"mirror_url\":null,\"archived\":false,\"disabled\":false,\"open_issues_count\":2,\"license\":{\"key\":\"mit\",\"name\":\"MIT License\",\"spdx_id\":\"MIT\",\"url\":\"https://api.github.com/licenses/mit\",\"node_id\":\"MDc6TGljZW5zZTEz\"},\"forks\":2,\"open_issues\":2,\"watchers\":7,\"default_branch\":\"master\"},{\"id\":146783877,\"node_id\":\"MDEwOlJlcG9zaXRvcnkxNDY3ODM4Nzc=\",\"name\":\"dcos-node-replacement\",\"full_name\":\"ApplauseOSS/dcos-node-replacement\",\"private\":false,\"owner\":{\"login\":\"ApplauseOSS\",\"id\":20522207,\"node_id\":\"MDEyOk9yZ2FuaXphdGlvbjIwNTIyMjA3\",\"avatar_url\":\"https://avatars1.githubusercontent.com/u/20522207?v=4\",\"gravatar_id\":\"\",\"url\":\"https://api.github.com/users/ApplauseOSS\",\"html_url\":\"https://github.com/ApplauseOSS\",\"followers_url\":\"https://api.github.com/users/ApplauseOSS/followers\",\"following_url\":\"https://api.github.com/users/ApplauseOSS/following{/other_user}\",\"gists_url\":\"https://api.github.com/users/ApplauseOSS/gists{/gist_id}\",\"starred_url\":\"https://api.github.com/users/ApplauseOSS/starred{/owner}{/repo}\",\"subscriptions_url\":\"https://api.github.com/users/ApplauseOSS/subscriptions\",\"organizations_url\":\"https://api.github.com/users/ApplauseOSS/orgs\",\"repos_url\":\"https://api.github.com/users/ApplauseOSS/repos\",\"events_url\":\"https://api.github.com/users/ApplauseOSS/events{/privacy}\",\"received_events_url\":\"https://api.github.com/users/ApplauseOSS/received_events\",\"type\":\"Organization\",\"site_admin\":false},\"html_url\":\"https://github.com/ApplauseOSS/dcos-node-replacement\",\"description\":\"Scripts, tools, and helpers for replacing nodes in a DC/OS cluster\",\"fork\":false,\"url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement\",\"forks_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/forks\",\"keys_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/keys{/key_id}\",\"collaborators_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/collaborators{/collaborator}\",\"teams_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/teams\",\"hooks_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/hooks\",\"issue_events_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/issues/events{/number}\",\"events_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/events\",\"assignees_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/assignees{/user}\",\"branches_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/branches{/branch}\",\"tags_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/tags\",\"blobs_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/git/blobs{/sha}\",\"git_tags_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/git/tags{/sha}\",\"git_refs_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/git/refs{/sha}\",\"trees_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/git/trees{/sha}\",\"statuses_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/statuses/{sha}\",\"languages_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/languages\",\"stargazers_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/stargazers\",\"contributors_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/contributors\",\"subscribers_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/subscribers\",\"subscription_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/subscription\",\"commits_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/commits{/sha}\",\"git_commits_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/git/commits{/sha}\",\"comments_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/comments{/number}\",\"issue_comment_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/issues/comments{/number}\",\"contents_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/contents/{+path}\",\"compare_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/compare/{base}...{head}\",\"merges_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/merges\",\"archive_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/{archive_format}{/ref}\",\"downloads_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/downloads\",\"issues_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/issues{/number}\",\"pulls_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/pulls{/number}\",\"milestones_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/milestones{/number}\",\"notifications_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/notifications{?since,all,participating}\",\"labels_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/labels{/name}\",\"releases_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/releases{/id}\",\"deployments_url\":\"https://api.github.com/repos/ApplauseOSS/dcos-node-replacement/deployments\",\"created_at\":\"2018-08-30T17:32:41Z\",\"updated_at\":\"2019-03-08T13:51:12Z\",\"pushed_at\":\"2019-03-08T13:51:14Z\",\"git_url\":\"git://github.com/ApplauseOSS/dcos-node-replacement.git\",\"ssh_url\":\"git@github.com:ApplauseOSS/dcos-node-replacement.git\",\"clone_url\":\"https://github.com/ApplauseOSS/dcos-node-replacement.git\",\"svn_url\":\"https://github.com/ApplauseOSS/dcos-node-replacement\",\"homepage\":null,\"size\":23,\"stargazers_count\":2,\"watchers_count\":2,\"language\":\"Shell\",\"has_issues\":true,\"has_projects\":false,\"has_downloads\":true,\"has_wiki\":false,\"has_pages\":false,\"forks_count\":3,\"mirror_url\":null,\"archived\":false,\"disabled\":false,\"open_issues_count\":0,\"license\":{\"key\":\"mit\",\"name\":\"MIT License\",\"spdx_id\":\"MIT\",\"url\":\"https://api.github.com/licenses/mit\",\"node_id\":\"MDc6TGljZW5zZTEz\"},\"forks\":3,\"open_issues\":0,\"watchers\":2,\"default_branch\":\"master\"}]";
		do {
			let repositories = try JSONDecoder().decode(Repositories.self, from: data.data(using: .utf8)!)
			if repositories.count != 2 {
				XCTFail("Wrong number of parsed repositories")
			}
		}
		catch let error {
			XCTFail(error.localizedDescription)
		}
	}
	
	func testFiltering() {
		let a = Repository(id: 1, nodeID: "Mock", name: "Test", fullName: "Mock", repositoryPrivate: false, owner: Owner(login: Login.applauseOSS, id: 1, nodeID: NodeID.mdEyOk9YZ2FuaXphdGlvbjIwNTIyMjA3, avatarURL: "Mock", gravatarID: "Mock", url: "Mock", htmlURL: "Mock", followersURL: "Mock", followingURL: FollowingURL.httpsAPIGithubCOMUsersApplauseOSSFollowingOtherUser, gistsURL: GistsURL.httpsAPIGithubCOMUsersApplauseOSSGistsGistID, starredURL: StarredURL.httpsAPIGithubCOMUsersApplauseOSSStarredOwnerRepo, subscriptionsURL: "Mock", organizationsURL: "Mock", reposURL: "Mock", eventsURL: EventsURL.httpsAPIGithubCOMUsersApplauseOSSEventsPrivacy, receivedEventsURL: "Mock", type: TypeEnum.organization, siteAdmin: false), htmlURL: "Mock", description: nil, fork: false, url: "Mock", forksURL: "Mock", keysURL: "Mock", collaboratorsURL: "Mock", teamsURL: "Mock", hooksURL: "Mock", issueEventsURL: "Mock", eventsURL: "Mock", assigneesURL: "Mock", branchesURL: "Mock", tagsURL: "Mock", blobsURL: "Mock", gitTagsURL: "Mock", gitRefsURL: "Mock", treesURL: "Mock", statusesURL: "Mock", languagesURL: "Mock", stargazersURL: "Mock", contributorsURL: "Mock", subscribersURL: "Mock", subscriptionURL: "Mock", commitsURL: "Mock", gitCommitsURL: "Mock", commentsURL: "Mock", issueCommentURL: "Mock", contentsURL: "Mock", compareURL: "Mock", mergesURL: "Mock", archiveURL: "Mock", downloadsURL: "Mock", issuesURL: "Mock", pullsURL: "Mock", milestonesURL: "Mock", notificationsURL: "Mock", labelsURL: "Mock", releasesURL: "Mock", deploymentsURL: "Mock", createdAt: "Mock", updatedAt: "Mock", pushedAt: "Mock", gitURL: "Mock", sshURL: "Mock", cloneURL: "Mock", svnURL: "Mock", homepage: nil, size: 1, stargazersCount: 1, watchersCount: 1, language: "Mock", hasIssues: false, hasProjects: false, hasDownloads: false, hasWiki: false, hasPages: false, forksCount: 1, mirrorURL: nil, archived: false, disabled: false, openIssuesCount: 0, license: nil, forks: 1, openIssues: 1, watchers: 1, defaultBranch: DefaultBranch.devel)
		let repos = [a]
		
		let positiveQueries = ["", "T", "Test", "test", "t", "es"]
		let negativeQueries = ["Testx", "Tset", "tset", " test", "test ", "@"]
		
		positiveQueries.forEach { (query) in
			if filterRepositories(repos, by: query).count != 1 {
				XCTFail("Valid query '\(query)' returned unexpected number of hits")
			}
		}
		
		negativeQueries.forEach { (query) in
			if filterRepositories(repos, by: query).count != 0 {
				XCTFail("Invalid query '\(query)' returned some hits")
			}
		}
	}
	
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
