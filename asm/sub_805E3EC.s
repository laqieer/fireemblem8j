	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_805E3EC, "ax", %progbits
@ sub_805E3EC @ JP 0x0805E3EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805E3EC
	.thumb_func
sub_805E3EC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805E418 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E41C @ =0x085FF5D0
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0805E420 @ =0x080E1AD0
	str r1, [r0, #0x48]
	ldr r1, _0805E424 @ =0x087526A8
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805E418: .4byte 0x0201774C
_0805E41C: .4byte 0x085FF5D0
_0805E420: .4byte 0x080E1AD0
_0805E424: .4byte 0x087526A8

