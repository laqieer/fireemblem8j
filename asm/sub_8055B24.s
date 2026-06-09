	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8055B24, "ax", %progbits
@ sub_8055B24 @ JP 0x08055B24 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8055B24
	.thumb_func
sub_8055B24:
	push {lr}
	ldr r0, [r0, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08055B48
	ldr r0, _08055B40 @ =0x02000054
	ldr r0, [r0]
	ldr r1, _08055B44 @ =0x02022B88
	movs r2, #8
	bl sub_80D636C
	b _08055B54
	.align 2, 0
_08055B40: .4byte 0x02000054
_08055B44: .4byte 0x02022B88
_08055B48:
	ldr r0, _08055B5C @ =0x02000054
	ldr r0, [r0, #4]
	ldr r1, _08055B60 @ =0x02022BC8
	movs r2, #8
	bl sub_80D636C
_08055B54:
	bl sub_8001EE4
	pop {r0}
	bx r0
	.align 2, 0
_08055B5C: .4byte 0x02000054
_08055B60: .4byte 0x02022BC8

