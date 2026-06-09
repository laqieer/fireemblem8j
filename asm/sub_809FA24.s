	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_809C5EC, 0x0809C5EC + 1
	.section .text.sub_809FA24, "ax", %progbits
@ sub_809FA24 @ JP 0x0809FA24 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809FA24
	.thumb_func
sub_809FA24:
	push {r4, lr}
	sub sp, #4
	ldr r0, _0809FA64 @ =0x0000A840
	str r0, [sp]
	movs r0, #0x40
	movs r1, #0x21
	movs r2, #5
	movs r3, #4
	bl sub_809C5EC
	ldr r4, _0809FA68 @ =0x085B8D24
	ldr r0, _0809FA6C @ =0x0000B080
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x25
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _0809FA70 @ =0x0000B088
	str r0, [sp]
	movs r0, #4
	movs r1, #0x48
	movs r2, #0x35
	adds r3, r4, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809FA64: .4byte 0x0000A840
_0809FA68: .4byte 0x085B8D24
_0809FA6C: .4byte 0x0000B080
_0809FA70: .4byte 0x0000B088

