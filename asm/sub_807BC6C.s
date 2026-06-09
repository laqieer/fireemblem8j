	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80139E0, 0x080139E0 + 1
	.section .text.sub_807BC6C, "ax", %progbits
@ sub_807BC6C @ JP 0x0807BC6C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807BC6C
	.thumb_func
sub_807BC6C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	ldrb r0, [r0, #1]
	adds r0, #0x10
	lsls r0, r0, #5
	ldr r1, _0807BC98 @ =0x020228A8
	adds r0, r0, r1
	movs r1, #0x15
	movs r2, #8
	adds r3, r4, #0
	bl sub_80139E0
	ldr r0, _0807BC9C @ =0x08A13380
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x54]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807BC98: .4byte 0x020228A8
_0807BC9C: .4byte 0x08A13380

