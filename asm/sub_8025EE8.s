	.syntax unified
	.set InitTargets, 0x08050618 + 1
	.set MapAddInRange, 0x0801A798 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_8024E5C, 0x08024E5C + 1
	.section .text.sub_8025EE8, "ax", %progbits
@ sub_8025EE8 @ JP 0x08025EE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8025EE8
	.thumb_func
sub_8025EE8:
	push {r4, r5, lr}
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	ldr r1, _08025F30 @ =0x02033F38
	str r0, [r1]
	adds r0, r4, #0
	adds r1, r5, #0
	bl InitTargets
	ldr r0, _08025F34 @ =0x0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #1
	bl MapAddInRange
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl MapAddInRange
	ldr r0, _08025F38 @ =sub_8025EA0
	bl sub_8024E5C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025F30: .4byte 0x02033F38
_08025F34: .4byte 0x0202E4E0
_08025F38: .4byte 0x08025EA1  @ sub_8025EA0

