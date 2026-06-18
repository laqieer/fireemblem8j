	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056214, 0x08056214 + 1
	.set sub_807A564, 0x0807A564 + 1
	.section .text.sub_807A5C0, "ax", %progbits
@ EfxSelfThunderBGMain @ JP 0x0807A5C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global EfxSelfThunderBGMain
	.thumb_func
EfxSelfThunderBGMain:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0807A62A
	ldr r1, [r4, #0x44]
	adds r1, #1
	str r1, [r4, #0x44]
	ldr r6, _0807A5FC @ =0x08855DF8
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r5, r0, #2
	adds r0, r5, r6
	ldr r0, [r0]
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldr r1, _0807A600 @ =0xFFFF0000
	cmp r0, r1
	bne _0807A604
	bl sub_8056130
	bl sub_8056214
	adds r0, r4, #0
	bl sub_8002DE4
	b _0807A630
	.align 2, 0
_0807A5FC: .4byte 0x08855DF8
_0807A600: .4byte 0xFFFF0000
_0807A604:
	adds r0, r6, #4
	adds r0, r5, r0
	ldr r1, [r0]
	adds r0, r6, #0
	adds r0, #8
	adds r0, r5, r0
	ldr r2, [r0]
	adds r0, r6, #0
	adds r0, #0xc
	adds r0, r5, r0
	ldr r3, [r0]
	adds r0, r6, #0
	adds r0, #0x10
	adds r0, r5, r0
	ldr r0, [r0]
	str r0, [sp]
	adds r0, r4, #0
	bl sub_807A564
_0807A62A:
	ldrh r0, [r4, #0x2c]
	subs r0, #1
	strh r0, [r4, #0x2c]
_0807A630:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

