	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80AEFDC, "ax", %progbits
@ sub_80AEFDC @ JP 0x080AEFDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AEFDC
	.thumb_func
sub_80AEFDC:
	push {lr}
	adds r2, r0, #0
	ldr r0, _080AEFF8 @ =0x0202BCAC
	ldrb r1, [r0, #4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _080AEFF4
	adds r0, r2, #0
	movs r1, #0x14
	bl Proc_Goto
_080AEFF4:
	pop {r0}
	bx r0
	.align 2, 0
_080AEFF8: .4byte 0x0202BCAC

