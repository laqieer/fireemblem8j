	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_80AEFFC, 0x080AEFFC + 1
	.set sub_80BE6AC, 0x080BE6AC + 1
	.set sub_80BEE68, 0x080BEE68 + 1
	.section .text.sub_800CE7C, "ax", %progbits
@ sub_800CE7C @ JP 0x0800CE7C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800CE7C
	.thumb_func
sub_800CE7C:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0800CEA4 @ =0x08AC1108
	adds r0, r4, #0
	bl Proc_Find
	bl sub_80BEE68
	adds r0, r4, #0
	bl Proc_Find
	bl sub_80BE6AC
	adds r0, r5, #0
	bl sub_80AEFFC
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800CEA4: .4byte 0x08AC1108

