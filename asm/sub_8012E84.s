	.syntax unified
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_8012E84, "ax", %progbits
@ sub_8012E84 @ JP 0x08012E84 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8012E84
	.thumb_func
sub_8012E84:
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	ldr r5, [sp, #0x10]
	cmp r5, #0
	bne _08012E92
	adds r0, r2, #0
	b _08012F46
_08012E92:
	cmp r0, #5
	bhi _08012F44
	lsls r0, r0, #2
	ldr r1, _08012EA0 @ =_08012EA4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08012EA0: .4byte _08012EA4
_08012EA4: @ jump table
	.4byte _08012EBC @ case 0
	.4byte _08012EC8 @ case 1
	.4byte _08012ED8 @ case 2
	.4byte _08012EEC @ case 3
	.4byte _08012F10 @ case 4
	.4byte _08012F22 @ case 5
_08012EBC:
	subs r0, r2, r6
	adds r2, r0, #0
	muls r2, r3, r2
	adds r0, r2, #0
	adds r1, r5, #0
	b _08012F08
_08012EC8:
	adds r0, r3, #0
	muls r0, r3, r0
	subs r1, r2, r6
	adds r2, r0, #0
	muls r2, r1, r2
	adds r1, r5, #0
	muls r1, r5, r1
	b _08012F06
_08012ED8:
	adds r0, r3, #0
	muls r0, r3, r0
	adds r1, r0, #0
	muls r1, r3, r1
	subs r0, r2, r6
	adds r2, r1, #0
	muls r2, r0, r2
	adds r0, r5, #0
	muls r0, r5, r0
	b _08012F02
_08012EEC:
	adds r0, r3, #0
	muls r0, r3, r0
	muls r0, r3, r0
	adds r1, r0, #0
	muls r1, r3, r1
	subs r0, r2, r6
	adds r2, r1, #0
	muls r2, r0, r2
	adds r0, r5, #0
	muls r0, r5, r0
	muls r0, r5, r0
_08012F02:
	adds r1, r0, #0
	muls r1, r5, r1
_08012F06:
	adds r0, r2, #0
_08012F08:
	bl sub_80D6374
	adds r0, r6, r0
	b _08012F46
_08012F10:
	subs r1, r5, r3
	adds r0, r1, #0
	muls r0, r1, r0
	subs r4, r2, r6
	adds r2, r0, #0
	muls r2, r4, r2
	adds r1, r5, #0
	muls r1, r5, r1
	b _08012F38
_08012F22:
	subs r1, r5, r3
	adds r0, r1, #0
	muls r0, r1, r0
	muls r0, r1, r0
	subs r4, r2, r6
	adds r2, r0, #0
	muls r2, r4, r2
	adds r0, r5, #0
	muls r0, r5, r0
	adds r1, r0, #0
	muls r1, r5, r1
_08012F38:
	adds r0, r2, #0
	bl sub_80D6374
	adds r4, r6, r4
	subs r0, r4, r0
	b _08012F46
_08012F44:
	movs r0, #0
_08012F46:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

