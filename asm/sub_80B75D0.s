	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80B75D0, "ax", %progbits
@ sub_80B75D0 @ JP 0x080B75D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B75D0
	.thumb_func
sub_80B75D0:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B75E8 @ =0x08AAFC54
	bl Proc_Find
	cmp r0, #0
	beq _080B75E2
	adds r0, #0x2c
	strb r4, [r0]
_080B75E2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B75E8: .4byte 0x08AAFC54

