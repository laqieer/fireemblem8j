	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8009F10, 0x08009F10 + 1
	.set sub_803113C, 0x0803113C + 1
	.section .text.sub_801C000, "ax", %progbits
@ sub_801C000 @ JP 0x0801C000 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801C000
	.thumb_func
sub_801C000:
	push {lr}
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #1
	beq _0801C00E
	movs r0, #8
	b _0801C022
_0801C00E:
	ldr r0, _0801C028 @ =0x085C2670
	bl Proc_Find
	cmp r0, #0
	beq _0801C01C
	bl sub_803113C
_0801C01C:
	bl sub_8009F10
	movs r0, #0x17
_0801C022:
	pop {r1}
	bx r1
	.align 2, 0
_0801C028: .4byte 0x085C2670

