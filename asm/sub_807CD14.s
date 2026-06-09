	.syntax unified
	.set sub_8015E18, 0x08015E18 + 1
	.section .text.sub_807CD14, "ax", %progbits
@ sub_807CD14 @ JP 0x0807CD14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807CD14
	.thumb_func
sub_807CD14:
	push {lr}
	adds r3, r0, #0
	ldr r1, _0807CD38 @ =0x0203E1EC
	adds r0, r1, #0
	adds r0, #0x5e
	ldrb r0, [r0]
	cmp r0, #1
	beq _0807CD34
	ldr r0, [r1, #0x14]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r3, #0
	bl sub_8015E18
_0807CD34:
	pop {r0}
	bx r0
	.align 2, 0
_0807CD38: .4byte 0x0203E1EC

