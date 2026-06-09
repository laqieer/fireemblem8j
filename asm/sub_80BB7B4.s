	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80BB7B4, "ax", %progbits
@ sub_80BB7B4 @ JP 0x080BB7B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BB7B4
	.thumb_func
sub_80BB7B4:
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	adds r1, r0, #0
	adds r1, #8
	str r1, [r2, #0x30]
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _080BB7CE
	adds r0, r2, #0
	movs r1, #0x64
	bl Proc_Goto
_080BB7CE:
	pop {r0}
	bx r0
	.align 2, 0

