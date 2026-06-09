	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set UpdateMapAnimDitheredCircleScanline, 0x08084A70 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8087E24, "ax", %progbits
@ sub_8087E24 @ JP 0x08087E24 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8087E24
	.thumb_func
sub_8087E24:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r1, #0x80
	movs r5, #0xf0
	ldr r4, [r7, #0x2c]
	adds r4, #1
	str r4, [r7, #0x2c]
	subs r1, r1, r4
	adds r0, r1, #0
	muls r0, r5, r0
	muls r0, r1, r0
	movs r6, #0x80
	lsls r6, r6, #7
	adds r1, r6, #0
	bl __divsi3
	adds r5, r0, #0
	lsls r0, r4, #4
	muls r0, r4, r0
	adds r1, r6, #0
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	movs r0, #0x78
	movs r1, #0x30
	adds r2, r5, #0
	bl UpdateMapAnimDitheredCircleScanline
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #2
	movs r1, #0
	movs r2, #0
	adds r3, r4, #0
	bl SetBlendConfig
	ldr r0, [r7, #0x2c]
	cmp r0, #0x80
	blt _08087E7A
	adds r0, r7, #0
	bl sub_8002DE4
_08087E7A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

