	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set ReadSuspendSave, 0x080AA62C + 1
	.set sub_8009EEC, 0x08009EEC + 1
	.set sub_803113C, 0x0803113C + 1
	.section .text.sub_801BFD0, "ax", %progbits
@ sub_801BFD0 @ JP 0x0801BFD0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801BFD0
	.thumb_func
sub_801BFD0:
	push {lr}
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #1
	beq _0801BFDE
	movs r0, #8
	b _0801BFF8
_0801BFDE:
	ldr r0, _0801BFFC @ =0x085C2670
	bl Proc_Find
	cmp r0, #0
	beq _0801BFEC
	bl sub_803113C
_0801BFEC:
	movs r0, #4
	bl ReadSuspendSave
	bl sub_8009EEC
	movs r0, #0x17
_0801BFF8:
	pop {r1}
	bx r1
	.align 2, 0
_0801BFFC: .4byte 0x085C2670

