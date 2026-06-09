	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_8050380, "ax", %progbits
@ sub_8050380 @ JP 0x08050380 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8050380
	.thumb_func
sub_8050380:
	push {lr}
	ldr r0, _0805039C @ =0x085E06B0
	bl Proc_Find
	cmp r0, #0
	beq _08050398
	adds r2, r0, #0
	adds r2, #0x63
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
_08050398:
	pop {r0}
	bx r0
	.align 2, 0
_0805039C: .4byte 0x085E06B0

