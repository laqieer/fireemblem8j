	.syntax unified
	.set sub_801A05C, 0x0801A05C + 1
	.set sub_801A09C, 0x0801A09C + 1
	.section .text.sub_803C420, "ax", %progbits
@ sub_803C420 @ JP 0x0803C420 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803C420
	.thumb_func
sub_803C420:
	push {lr}
	adds r2, r0, #0
	ldr r0, _0803C43C @ =0x0203AA00
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803C440
	adds r0, r2, #0
	movs r1, #0
	bl sub_801A09C
	b _0803C446
	.align 2, 0
_0803C43C: .4byte 0x0203AA00
_0803C440:
	adds r0, r2, #0
	bl sub_801A05C
_0803C446:
	pop {r0}
	bx r0
	.align 2, 0

