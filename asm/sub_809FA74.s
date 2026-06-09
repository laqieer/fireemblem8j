	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_809C5EC, 0x0809C5EC + 1
	.section .text.sub_809FA74, "ax", %progbits
@ sub_809FA74 @ JP 0x0809FA74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809FA74
	.thumb_func
sub_809FA74:
	push {lr}
	sub sp, #4
	ldr r0, _0809FAA0 @ =0x0000A840
	str r0, [sp]
	movs r0, #0x40
	movs r1, #0x21
	movs r2, #5
	movs r3, #2
	bl sub_809C5EC
	ldr r3, _0809FAA4 @ =0x085B8D24
	ldr r0, _0809FAA8 @ =0x0000B080
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x25
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0809FAA0: .4byte 0x0000A840
_0809FAA4: .4byte 0x085B8D24
_0809FAA8: .4byte 0x0000B080

