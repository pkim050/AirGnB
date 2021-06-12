let arrId = []
$( document ).ready(function() {
    function getGymIds() {
        fetch("/gyms.json")
        .then(resp => resp.json())
        .then(data => {
            data.forEach(gym => {
                arrId.push(gym.id)
            })
        })
    }

    getGymIds()
    class Gym {
        constructor(obj) {
            this.id = obj.id
            this.name = obj.name
            this.description = obj.description
            this.address_1 = obj.address_1
            this.address_2 = obj.address_2
            this.city = obj.city
            this.state = obj.state
            this.guests = obj.guests
            this.price = obj.price
            this.filename = obj.filename
            this.reservations = obj.reservations
        }
    }
    
    Gym.prototype.show = function() {
        debugger
        let showHtml = `
        <img src="/assets/${this.filename}" class="img">
        <h1 class="title">${this.name}</h1>
        <h2 class="description">${this.description}</h2>
        Address: <h3 class="address">${this.address_1}, ${this.city}, ${this.state}<br>
        <h3 class="guests">Maximum Occupancy: ${this.guests}</h3>
        <h4 class="price">Price per Day: $${this.price}</h4>`
        let linkHtml = `
        <a href="/gyms/${this.id}/reservations/new" class="book-gym">Book Gym</a>`
        return showHtml + linkHtml
    }

    Gym.prototype.index = function () {
        let showHTML = `
        <p>${this.description}</p>
        <p>Address: ${this.address_1}, ${this.city}, ${this.state}</p>`
        return showHTML
    }
    
    const body = document.querySelector("body")
    let correctArr = 0
    body.addEventListener("click", function(e) {
        const tempArr = e.target.baseURI.split("/")
        const tempLength = tempArr["length"]
        let gymId = parseInt(tempArr[tempLength - 1], 10)
        const indexId = e.target.id
        if (e.target.className === "gym-form") {
            fetch(`${window.location.origin}/gyms/${indexId}.json`)
            .then(resp => resp.json())
            .then(data => {
                $(`#gym-${indexId}`).html("")
                let newShow = new Gym(data)
                let gymHtml = newShow.index()
                $(`#gym-${indexId}`).append(gymHtml)

            })
            fetch(`${window.location.origin}/gyms/${indexId}/reservations/new.html`)
            .then(resp => resp.text())
            .then(data => {
                let dataArr = data.split(`<p class="alert"></p>`)
                $(`#gym-${indexId}`).append(dataArr[1])
                $(`#gym-${indexId}`).append(`<br><br>`)
            })
        }
        if (e.target.className === "prev-gym") {
            for (let i = 0; i < arrId.length; i++) {
                if (arrId[i] === gymId) {
                    if (i === 0) {
                        correctArr = arrId[arrId.length - 1]
                    }
                    else {
                        correctArr = arrId[i - 1]
                    }
                }
            }
            fetch(`${window.location.origin}/gyms/${correctArr}.json`)
            .then(resp => resp.json())
            .then(gym => {
                $("#show-gyms").html("")
                $(".book-gym").html("")
                let newShow = new Gym(gym)
                let gymHtml = newShow.show()
                $("#show-gyms").append(gymHtml)
                history.pushState(null, null, `${window.location.origin}/gyms/${correctArr}`)
            })
        }
        if (e.target.className === "next-gym") {
            for (let i = 0; i < arrId.length; i++) {
                if (arrId[i] === gymId) {
                    if (arrId[i] === arrId[arrId.length - 1]) {
                        correctArr = arrId[0]
                    }
                    else {
                        correctArr = arrId[i + 1]
                    }
                }
            }
            fetch(`${window.location.origin}/gyms/${correctArr}.json`)
            .then(resp => resp.json())
            .then(gym => {
                $("#show-gyms").html("")
                $(".book-gym").html("")
                let newShow = new Gym(gym)
                let gymHtml = newShow.show()
                $("#show-gyms").append(gymHtml)
                history.pushState(null, null, `${window.location.origin}/gyms/${correctArr}`)
            })
        }
    })
});