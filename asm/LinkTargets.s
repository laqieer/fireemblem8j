	.syntax unified
	.section .text.LinkTargets, "ax", %progbits
@ LinkTargets @ JP 0x08050684 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global LinkTargets
	.thumb_func
LinkTargets:
	push {r4, r5, r6, lr}
	movs r2, #0
	ldr r0, _080506C4 @ =0x0203E0E8
	ldr r1, [r0]
	adds r6, r0, #0
	ldr r4, _080506C8 @ =0x0203DDE8
	cmp r2, r1
	bge _080506AE
	adds r5, r6, #0
	adds r3, r4, #0
	adds r3, #0xc
	adds r1, r4, #0
	subs r1, #0xc
_0805069E:
	str r1, [r1, #0x14]
	str r3, [r1, #0x10]
	adds r3, #0xc
	adds r1, #0xc
	adds r2, #1
	ldr r0, [r5]
	cmp r2, r0
	blt _0805069E
_080506AE:
	ldr r1, [r6]
	subs r1, #1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	str r0, [r4, #8]
	str r4, [r0, #4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080506C4: .4byte 0x0203E0E8
_080506C8: .4byte 0x0203DDE8

