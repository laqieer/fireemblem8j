	.syntax unified
	.set IsGamePlayedThrough, 0x080A82B4 + 1
	.section .text.sub_8030C10, "ax", %progbits
@ sub_8030C10 @ JP 0x08030C10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8030C10
	.thumb_func
sub_8030C10:
	push {lr}
	bl IsGamePlayedThrough
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08030C20
	movs r0, #1
	b _08030C3E
_08030C20:
	ldr r2, _08030C38 @ =0x0202BCEC
	ldrb r1, [r2, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08030C3C
	adds r0, r2, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1f
	b _08030C3E
	.align 2, 0
_08030C38: .4byte 0x0202BCEC
_08030C3C:
	movs r0, #0
_08030C3E:
	pop {r1}
	bx r1
	.align 2, 0

