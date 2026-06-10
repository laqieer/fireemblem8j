	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_8013D40, "ax", %progbits
@ sub_8013D40 @ JP 0x08013D40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8013D40
	.thumb_func
sub_8013D40:
	push {lr}
	ldr r0, _08013D70 @ =0x085C24C8
	bl Proc_Find
	cmp r0, #0
	bne _08013D80
	ldr r0, _08013D74 @ =0x085C24A8
	bl Proc_Find
	cmp r0, #0
	bne _08013D80
	ldr r0, _08013D78 @ =0x085C2508
	bl Proc_Find
	cmp r0, #0
	bne _08013D80
	ldr r0, _08013D7C @ =0x085C24E8
	bl Proc_Find
	cmp r0, #0
	bne _08013D80
	movs r0, #0
	b _08013D82
	.align 2, 0
_08013D70: .4byte 0x085C24C8
_08013D74: .4byte 0x085C24A8
_08013D78: .4byte 0x085C2508
_08013D7C: .4byte 0x085C24E8
_08013D80:
	movs r0, #1
_08013D82:
	pop {r1}
	bx r1
	.align 2, 0

