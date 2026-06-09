	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set sub_8027144, 0x08027144 + 1
	.section .text.sub_803124C, "ax", %progbits
@ sub_803124C @ JP 0x0803124C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803124C
	.thumb_func
sub_803124C:
	push {r4, lr}
	adds r4, r0, #0
	bl RefreshEntityBmMaps
	bl sub_8027144
	ldr r2, _08031284 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08031284: .4byte 0x03003020

