	.syntax unified
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80130D8, "ax", %progbits
@ sub_80130D8 @ JP 0x080130D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80130D8
	.thumb_func
sub_80130D8:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	lsls r4, r2, #5
	cmp r3, #0
	ble _08013108
	adds r5, r3, #0
_080130E6:
	adds r2, r4, #0
	cmp r4, #0
	bge _080130EE
	adds r2, r4, #3
_080130EE:
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_80D636C
	adds r7, r7, r4
	movs r0, #0x80
	lsls r0, r0, #3
	adds r6, r6, r0
	subs r5, #1
	cmp r5, #0
	bne _080130E6
_08013108:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

