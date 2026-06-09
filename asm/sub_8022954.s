	.syntax unified
	.set GetSelectTargetCount, 0x08050A9C + 1
	.set sub_8025490, 0x08025490 + 1
	.section .text.sub_8022954, "ax", %progbits
@ sub_8022954 @ JP 0x08022954 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8022954
	.thumb_func
sub_8022954:
	push {lr}
	ldr r0, _0802298C @ =0x03004DF0
	ldr r3, [r0]
	ldr r2, [r3, #0xc]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	bne _08022994
	ldr r0, _08022990 @ =0x0202BCAC
	adds r0, #0x3d
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08022994
	movs r0, #0x10
	ands r2, r0
	cmp r2, #0
	bne _08022994
	adds r0, r3, #0
	bl sub_8025490
	bl GetSelectTargetCount
	cmp r0, #0
	beq _08022994
	movs r0, #1
	b _08022996
	.align 2, 0
_0802298C: .4byte 0x03004DF0
_08022990: .4byte 0x0202BCAC
_08022994:
	movs r0, #3
_08022996:
	pop {r1}
	bx r1
	.align 2, 0

