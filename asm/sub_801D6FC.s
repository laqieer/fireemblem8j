	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_801D500, 0x0801D500 + 1
	.set sub_801D590, 0x0801D590 + 1
	.section .text.sub_801D6FC, "ax", %progbits
@ sub_801D6FC @ JP 0x0801D6FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801D6FC
	.thumb_func
sub_801D6FC:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0801D718 @ =0x085C31D0
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _0801D71C
	bl sub_801D590
	movs r0, #0
	bl sub_801D500
	b _0801D728
	.align 2, 0
_0801D718: .4byte 0x085C31D0
_0801D71C:
	adds r0, r4, #0
	movs r1, #4
	bl sub_8002BCC
	adds r0, #0x4a
	strh r5, [r0]
_0801D728:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

