// Birthday Card Opening
const birthdayCard = document.getElementById('birthdayCard');
if (birthdayCard) {
    birthdayCard.addEventListener('click', () => {
        birthdayCard.classList.toggle('opened');
    });
}

// Video Carousel
const carouselSlides = [
    {
        type: 'video',
        src: 'dist/videos/01_prague_morning.mp4',
        title: 'Prague Morning',
        description: 'Sunrise over Charles Bridge as dawn bells echo through Old Town.'
    },
    {
        type: 'video',
        src: 'dist/videos/02_white_mountain.mp4',
        title: 'White Mountain Procession',
        description: 'Cavalry banners and marching drums climbing toward the monastery ridge.'
    },
    {
        type: 'video',
        src: 'dist/videos/03_imperial_edict.mp4',
        title: 'Imperial Edict',
        description: 'The proclamation ceremony captured in cinematic detail.'
    },
    {
        type: 'image',
        src: 'dist/videos/painting_01.png',
        title: 'Renaissance Portrait I',
        description: 'Classical painting in the tradition of the old masters.'
    },
    {
        type: 'video',
        src: 'dist/videos/04_birthday_toast.mp4',
        title: 'Birthday Toast',
        description: 'Champagne raised, candles glowing, family singing in harmony.'
    },
    {
        type: 'image',
        src: 'dist/videos/painting_02.png',
        title: 'Renaissance Portrait II',
        description: 'Timeless portraiture echoing the great European tradition.'
    },
    {
        type: 'video',
        src: 'dist/videos/05_lakeside_serenade.mp4',
        title: 'Lakeside Serenade',
        description: 'Max the spaniel harmonizing by the water at sunset.'
    },
    {
        type: 'video',
        src: 'dist/videos/06_freestyle_tribute.mp4',
        title: 'Freestyle Tribute',
        description: 'An impromptu birthday rap celebration.'
    },
    {
        type: 'image',
        src: 'dist/videos/painting_03.png',
        title: 'Renaissance Portrait III',
        description: 'Final masterpiece in classical European style.'
    },
    {
        type: 'video',
        src: 'dist/videos/07_jolly_good_fellow.mp4',
        title: 'Jolly Good Fellow',
        description: 'The family chorus that brought rehearsals to a close.'
    },
    {
        type: 'video',
        src: 'dist/videos/08_thirty_years_war.mp4',
        title: 'Thirty Years War',
        description: 'Epic cinematic journey through European history.'
    }
];

let currentSlide = 0;
const carouselContent = document.getElementById('carouselContent');
const carouselDots = document.getElementById('carouselDots');
const prevBtn = document.getElementById('prevBtn');
const nextBtn = document.getElementById('nextBtn');

if (carouselContent) {
    // Build carousel slides
    carouselSlides.forEach((slide, index) => {
        const slideDiv = document.createElement('div');
        slideDiv.className = 'carousel-slide';

        const mediaElement = slide.type === 'video'
            ? `<video controls preload="metadata"><source src="${slide.src}" type="video/mp4"></video>`
            : `<img src="${slide.src}" alt="${slide.title}">`;

        slideDiv.innerHTML = `
            <h2>${slide.title}</h2>
            <p>${slide.description}</p>
            ${mediaElement}
        `;
        carouselContent.appendChild(slideDiv);

        // Build dots
        const dot = document.createElement('button');
        dot.className = 'carousel-dot';
        if (index === 0) dot.classList.add('active');
        dot.addEventListener('click', () => goToSlide(index));
        carouselDots.appendChild(dot);
    });

    // Navigation functions
    function goToSlide(n) {
        // Pause all videos
        document.querySelectorAll('.carousel-slide video').forEach(v => v.pause());

        currentSlide = (n + carouselSlides.length) % carouselSlides.length;
        carouselContent.style.transform = `translateX(-${currentSlide * 100}%)`;

        // Update dots
        document.querySelectorAll('.carousel-dot').forEach((dot, i) => {
            dot.classList.toggle('active', i === currentSlide);
        });
    }

    prevBtn.addEventListener('click', () => goToSlide(currentSlide - 1));
    nextBtn.addEventListener('click', () => goToSlide(currentSlide + 1));

    // Keyboard navigation
    document.addEventListener('keydown', (e) => {
        if (e.key === 'ArrowLeft') goToSlide(currentSlide - 1);
        if (e.key === 'ArrowRight') goToSlide(currentSlide + 1);
    });
}

// Photo Gallery Dynamic Loading
const photoFiles = [
    'R - 0.jpeg', 'R - 1.jpeg', 'R - 2.jpeg', 'R - 3.jpeg', 'R - 4.jpeg',
    'R - 5.jpeg', 'R - 6.JPG', 'R - 7.JPG', 'R - 8.JPG', 'R - 9.JPG',
    'R - 10.JPG', 'R - 11.JPG', 'R - 12.JPG', 'R - 13.jpeg', 'R - 14.jpg',
    'R - 15.jpg', 'R - 16.jpg', 'R - 17.jpg', 'R - 18.jpg', 'R - 20.JPG',
    'R - 21.JPG', 'R - 22.JPG', 'R - 23.JPG', 'R - 24.JPG', 'R - 25.jpeg',
    'R - 26.jpeg', 'R - 27.jpeg', 'R - 28.jpeg'
];

const gallery = document.getElementById('photoGallery');
const lightbox = document.getElementById('lightbox');
const lightboxImg = document.getElementById('lightbox-img');
const lightboxClose = document.querySelector('.lightbox-close');

// Load photos into gallery
photoFiles.forEach((photo, index) => {
    const item = document.createElement('div');
    item.className = 'gallery-item';
    item.innerHTML = `<img src="dist/${photo}" alt="Memory ${index + 1}" loading="lazy">`;
    item.addEventListener('click', () => openLightbox(`dist/${photo}`));
    gallery.appendChild(item);
});

// Lightbox functionality
function openLightbox(src) {
    lightboxImg.src = src;
    lightbox.classList.add('active');
    document.body.style.overflow = 'hidden';
}

function closeLightbox() {
    lightbox.classList.remove('active');
    document.body.style.overflow = 'auto';
}

lightboxClose.addEventListener('click', closeLightbox);
lightbox.addEventListener('click', (e) => {
    if (e.target === lightbox) closeLightbox();
});

document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') closeLightbox();
});

// Smooth scroll indicator fade
window.addEventListener('scroll', () => {
    const scrollIndicator = document.querySelector('.scroll-indicator');
    if (scrollIndicator) {
        const opacity = Math.max(0, 1 - window.scrollY / 300);
        scrollIndicator.style.opacity = opacity;
    }
});

// Intersection Observer for fade-in animations
const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -100px 0px'
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.style.opacity = '1';
            entry.target.style.transform = 'translateY(0)';
        }
    });
}, observerOptions);

document.querySelectorAll('.gallery-item, .tribute-text p').forEach(el => {
    el.style.opacity = '0';
    el.style.transform = 'translateY(30px)';
    el.style.transition = 'opacity 0.8s ease, transform 0.8s ease';
    observer.observe(el);
});
