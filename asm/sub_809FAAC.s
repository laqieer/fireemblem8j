	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_809C5EC, 0x0809C5EC + 1
	.section .text.sub_809FAAC, "ax", %progbits
@ sub_809FAAC @ JP 0x0809FAAC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809FAAC
	.thumb_func
sub_809FAAC:
	push {lr}
	sub sp, #4
	ldr r0, _0809FAD8 @ =0x0000A840
	str r0, [sp]
	movs r0, #0x40
	movs r1, #0x31
	movs r2, #5
	movs r3, #2
	bl sub_809C5EC
	ldr r3, _0809FADC @ =0x085B8D24
	ldr r0, _0809FAE0 @ =0x0000B088
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x35
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0809FAD8: .4byte 0x0000A840
_0809FADC: .4byte 0x085B8D24
_0809FAE0: .4byte 0x0000B088

