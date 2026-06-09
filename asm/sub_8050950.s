	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_8050950, "ax", %progbits
@ sub_8050950 @ JP 0x08050950 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8050950
	.thumb_func
sub_8050950:
	push {lr}
	ldr r0, _0805096C @ =0x085E073C
	bl Proc_Find
	cmp r0, #0
	beq _08050968
	adds r2, r0, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0xbf
	ands r0, r1
	strb r0, [r2]
_08050968:
	pop {r0}
	bx r0
	.align 2, 0
_0805096C: .4byte 0x085E073C

