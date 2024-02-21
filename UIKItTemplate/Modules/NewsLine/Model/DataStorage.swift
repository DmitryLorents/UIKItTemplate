// DataStorage.swift
// Copyright © RoadMap. All rights reserved.

/// All data for content showing
struct DataStorage {
    // MARK: - Stories

    /// Stories
    let stories: [Story] = [
        .init(userName: "liver 15", imageName: "girl3"),
        .init(userName: "shaverma 33", imageName: "girl2"),
        .init(userName: "liver 15", imageName: "girl3"),
        .init(userName: "barbara 001", imageName: "girl4"),
        .init(userName: "drink forever", imageName: "girl2"),
        .init(userName: "masha", imageName: "girl3"),
        .init(userName: "constraint 90", imageName: "girl4"),
        .init(userName: "liver 15", imageName: "girl2")
    ]

    // MARK: - Posts

    /// Posts
    let posts: [Post] = [
        .init(
            avatarImageName: "man1",
            nickName: "go to Brazil",
            imageNames: ["nature1", "nature2", "nature3"],
            title: "ПОездка в бразилию подарит вам незабываемые впечатления. Бронируйте только сейчас",
            timeStamp: "13 минут вперед"
        ),
        .init(
            avatarImageName: "man2",
            nickName: "homik",
            imageNames: ["nature2"],
            title: "Разведение хомяков в домашних условиях. Плодятся лучше кроликов!",
            timeStamp: "13 минут назад"
        ),
        .init(
            avatarImageName: "girl2",
            nickName: "Kazakhstan_forever",
            imageNames: ["nature4"],
            title: "ПОездка в Казахстан подарит вам незабываемые впечатления. Бронируйте только сейчас",
            timeStamp: "13 дней вперед"
        ),
        .init(
            avatarImageName: "man4",
            nickName: "go to Brazil",
            imageNames: ["nature1", "nature3"],
            title: "ПОездка в бразилию подарит вам незабываемые впечатления. Бронируйте только сейчас",
            timeStamp: "13 минут вперед"
        ),
        .init(
            avatarImageName: "man2",
            nickName: "go to Brazil",
            imageNames: ["nature1", "nature2", "nature4", "nature3"],
            title: "ПОездка в бразилию подарит вам незабываемые впечатления. Бронируйте только сейчас",
            timeStamp: "13 минут вперед"
        ),
        .init(
            avatarImageName: "man1",
            nickName: "go to Brazil",
            imageNames: ["nature1"],
            title: "ПОездка в бразилию подарит вам незабываемые впечатления. Бронируйте только сейчас",
            timeStamp: "13 минут вперед"
        )
    ]

    // MARK: - Recomendations

    /// Recomendations
    let recomendations: [Recomendation] = [
        .init(userName: "hromoy-405", imageName: "girl2"),
        .init(userName: "hromoy-405", imageName: "man3"),
        .init(userName: "hromoy-405", imageName: "nature4"),
        .init(userName: "hromoy-405", imageName: "man1"),
        .init(userName: "hromoy-405", imageName: "girl4"),
        .init(userName: "hromoy-405", imageName: "nature1"),
    ]

    // MARK: - Notifications

    /// Headers
    let headers = ["Сегодня", "На этой неделе"]

    /// Notices for today
    private let todayNotices: [Notice] = [
        .init(
            userName: "bob_marley",
            avatarImage: "man3",
            description: "Круто!",
            timePast: "5ч",
            postImage: "nature2",
            type: .like
        ),
        .init(
            userName: "shaverma-14",
            avatarImage: "man1",
            description: "Ух ты!",
            timePast: "1ч",
            postImage: "nature1",
            type: .subscribe
        ),
        .init(
            userName: "bob_marley",
            avatarImage: "man3",
            description: "Не ожидал!",
            timePast: "3ч",
            postImage: "nature4",
            type: .like
        ),
    ]
    /// Notices for last week
    private let weakNotices: [Notice] = [
        .init(
            userName: "miha",
            avatarImage: "man4",
            description: "Ого!",
            timePast: "1д",
            postImage: "nature2",
            type: .like
        ),
        .init(
            userName: "bob_marley",
            avatarImage: "nature3",
            description: "Удивлена!",
            timePast: "5д",
            postImage: "nature2",
            type: .subscribe
        ),
        .init(
            userName: "bob_marley",
            avatarImage: "man3",
            description: "Круто!",
            timePast: "2д",
            postImage: "girl2",
            type: .like
        ),
        .init(
            userName: "bob_marley",
            avatarImage: "girl1",
            description: "Не верю!",
            timePast: "5д",
            postImage: "nature2",
            type: .like
        ),
        .init(
            userName: "bob_marley",
            avatarImage: "girl3",
            description: "Круто!",
            timePast: "1д",
            postImage: "nature2",
            type: .subscribe
        ),
    ]
    /// Dictionary. Key: header title, Value: notices related to exact header
    var noticeMap: [String: [Notice]] {
        .init(uniqueKeysWithValues: zip(headers, [todayNotices, weakNotices]))
    }
}
