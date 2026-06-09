	.syntax unified
	.set GetGMapBaseMenuKind, 0x080C8E28 + 1
	.set sub_809C5EC, 0x0809C5EC + 1
	.section .text.sub_809AE40, "ax", %progbits
@ sub_809AE40 @ JP 0x0809AE40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809AE40
	.thumb_func
sub_809AE40:
	push {lr}
	sub sp, #4
	bl GetGMapBaseMenuKind
	cmp r0, #3
	bne _0809AE64
	ldr r0, _0809AE60 @ =0x0000A440
	str r0, [sp]
	movs r0, #0x88
	movs r1, #0x51
	movs r2, #9
	movs r3, #6
	bl sub_809C5EC
	b _0809AE74
	.align 2, 0
_0809AE60: .4byte 0x0000A440
_0809AE64:
	ldr r0, _0809AE7C @ =0x0000A440
	str r0, [sp]
	movs r0, #0x88
	movs r1, #0x51
	movs r2, #9
	movs r3, #6
	bl sub_809C5EC
_0809AE74:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0809AE7C: .4byte 0x0000A440

