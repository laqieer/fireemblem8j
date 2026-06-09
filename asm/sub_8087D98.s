	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set UpdateMapAnimDitheredCircleScanline, 0x08084A70 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8087D98, "ax", %progbits
@ sub_8087D98 @ JP 0x08087D98 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8087D98
	.thumb_func
sub_8087D98:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r5, #0x40
	movs r0, #0xf0
	ldr r4, [r7, #0x2c]
	adds r4, #1
	str r4, [r7, #0x2c]
	muls r0, r4, r0
	muls r0, r4, r0
	movs r6, #0x80
	lsls r6, r6, #5
	adds r1, r6, #0
	bl __divsi3
	mov r8, r0
	subs r5, r5, r4
	lsls r0, r5, #4
	muls r0, r5, r0
	adds r1, r6, #0
	bl __divsi3
	movs r4, #0x10
	subs r4, r4, r0
	movs r0, #0x78
	movs r1, #0x68
	mov r2, r8
	bl UpdateMapAnimDitheredCircleScanline
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #2
	movs r1, #0
	movs r2, #0
	adds r3, r4, #0
	bl SetBlendConfig
	ldr r0, [r7, #0x2c]
	cmp r0, #0x40
	blt _08087DF0
	adds r0, r7, #0
	bl sub_8002DE4
_08087DF0:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

