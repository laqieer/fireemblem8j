	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_800339C, 0x0800339C + 1
	.section .text.sub_801D44C, "ax", %progbits
@ sub_801D44C @ JP 0x0801D44C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801D44C
	.thumb_func
sub_801D44C:
	push {lr}
	ldr r0, _0801D470 @ =0x085C2F58
	bl Proc_Find
	adds r2, r0, #0
	cmp r2, #0
	beq _0801D46A
	ldr r1, [r2, #0xc]
	ldr r0, _0801D474 @ =sub_801C984
	cmp r1, r0
	bne _0801D46A
	ldr r1, _0801D478 @ =sub_801D47C
	adds r0, r2, #0
	bl sub_800339C
_0801D46A:
	pop {r0}
	bx r0
	.align 2, 0
_0801D470: .4byte 0x085C2F58
_0801D474: .4byte 0x0801C985  @ sub_801C984
_0801D478: .4byte 0x0801D47D  @ sub_801D47C

