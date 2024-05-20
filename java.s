document.addEventListener('DOMContentLoaded', function() {
    const animeList = document.getElementById('anime-list');
    const seriesList = document.getElementById('series-list');
    const gamesList = document.getElementById('games-list');
    const episodeList = document.getElementById('episode-list');

    function createCard(item) {
        const card = document.createElement('div');
        card.className = 'card';

        const img = document.createElement('img');
        img.src = item.image;
        img.alt = item.title;

        const title = document.createElement('h3');
        title.textContent = item.title;

        const description = document.createElement('p');
        description.textContent = item.description;

        card.appendChild(img);
        card.appendChild(title);
        card.appendChild(description);

        return card;
    }

    // Populate anime list
    data.anime.forEach(anime => {
        animeList.appendChild(createCard(anime));
    });

    // Populate series list
    data.series.forEach(series => {
        seriesList.appendChild(createCard(series));
    });

    // Populate games list
    data.games.forEach(game => {
        gamesList.appendChild(createCard(game));
    });

    // Show episodes and play selected episode when series is clicked
    document.querySelectorAll('#series-list .card').forEach(card => {
        card.addEventListener('click', function() {
            // Hide other sections
            document.getElementById('anime').style.display = 'none';
            document.getElementById('games').style.display = 'none';
            // Show episodes section
            document.getElementById('episodes').style.display = 'block';
            // Clear previous episodes
            episodeList.innerHTML = '';
            // Populate episodes list
            const seriesTitle = this.querySelector('h3').textContent;
            const seriesData = data.series.find(series => series.title === seriesTitle);
            seriesData.episodes.forEach(episode => {
                const episodeCard = createCard(episode);
                episodeCard.addEventListener('click', function() {
                    // Play selected episode (replace with actual playback logic)
                    alert(`Now playing: ${episode.title}`);
                });
                episodeList.appendChild(episodeCard);
            });
        });
    });

    // Play game when game card is clicked
    document.querySelectorAll('#games-list .card').forEach(card => {
        card.addEventListener('click', function() {
            // Get game title
            const gameTitle = this.querySelector('h3').textContent;
            // Simulate playing game (replace with actual gameplay logic)
            alert(`Playing ${gameTitle}!`);
        });
