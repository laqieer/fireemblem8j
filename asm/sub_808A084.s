	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_808A8FC, 0x0808A8FC + 1
	.section .text.sub_808A084, "ax", %progbits
@ sub_808A084 @ JP 0x0808A084 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808A084
	.thumb_func
sub_808A084:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x4a
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetUnit
	ldr r1, _0808A0AC @ =0x02003BFC
	str r0, [r1, #0xc]
	ldr r0, _0808A0B0 @ =0x08A72A90
	bl Proc_Find
	bl sub_808A8FC
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A0AC: .4byte 0x02003BFC
_0808A0B0: .4byte 0x08A72A90

