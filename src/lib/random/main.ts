class Random {
    private x: number
    private y: number
    private z: number
    private w: number

    constructor(seed = 19681106) {
        this.x = 31415926535;
        this.y = 8979323846;
        this.z = 2643383279;
        this.w = seed;
    }

    xorShift() {
        const t = this.x ^ (this.x << 11);
        this.x = this.y; this.y = this.z; this.z = this.w;
        return this.w = (this.w ^ (this.w >>> 19)) ^ (t ^ (t >>> 8));
    }

    // min以上max以下の乱数を生成する
    generate(min: number, max: number) {
        const r = Math.abs(this.xorShift());
        return min + (r % (max + 1 - min));
    }
}