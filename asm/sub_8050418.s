	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set __divsi3, 0x080D65F8 + 1
	.section .text.sub_8050418, "ax", %progbits
@ sub_8050418 @ JP 0x08050418 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8050418
	.thumb_func
sub_8050418:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r2, #0
	adds r1, r4, #0
	adds r1, #0x60
	ldrb r0, [r1]
	cmp r0, #9
	bls _08050464
	lsls r0, r0, #4
	subs r0, #0x90
	adds r1, #1
	ldrb r1, [r1]
	muls r0, r1, r0
	movs r1, #9
	bl __divsi3
	adds r6, r0, #0
	adds r5, r4, #0
	adds r5, #0x64
	ldrb r0, [r5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	movs r1, #0
	adds r2, r4, #0
	bl BG_SetPosition
	ldrb r0, [r5]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	movs r1, #0
	adds r2, r4, #0
	bl BG_SetPosition
	ldr r0, [r7]
	subs r0, r0, r6
	str r0, [r7]
_08050464:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

