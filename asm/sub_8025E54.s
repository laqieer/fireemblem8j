	.syntax unified
	.set InitTargets, 0x08050618 + 1
	.set MapAddInRange, 0x0801A798 + 1
	.set sub_8018730, 0x08018730 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_8024E5C, 0x08024E5C + 1
	.section .text.sub_8025E54, "ax", %progbits
@ sub_8025E54 @ JP 0x08025E54 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8025E54
	.thumb_func
sub_8025E54:
	push {r4, r5, r6, lr}
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	ldr r4, _08025E94 @ =0x02033F38
	str r0, [r4]
	adds r0, r5, #0
	adds r1, r6, #0
	bl InitTargets
	ldr r0, _08025E98 @ =0x0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	ldr r0, [r4]
	bl sub_8018730
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #1
	bl MapAddInRange
	ldr r0, _08025E9C @ =sub_8025DCC
	bl sub_8024E5C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08025E94: .4byte 0x02033F38
_08025E98: .4byte 0x0202E4E0
_08025E9C: .4byte 0x08025DCD  @ sub_8025DCC

