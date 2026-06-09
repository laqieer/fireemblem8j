	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80C5088, "ax", %progbits
@ sub_80C5088 @ JP 0x080C5088 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C5088
	.thumb_func
sub_80C5088:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _080C50E0 @ =0x08AC1FE4
	bl Proc_Find
	adds r2, r0, #0
	movs r0, #0x29
	adds r0, r0, r2
	mov ip, r0
	ldrb r0, [r0]
	movs r3, #1
	ands r3, r0
	cmp r3, #0
	bne _080C50E4
	adds r1, r2, #0
	adds r1, #0x2c
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2d
	strb r3, [r0]
	adds r1, #2
	movs r0, #0x38
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2f
	strb r3, [r0]
	strh r4, [r2, #0x30]
	lsls r0, r5, #0xc
	str r0, [r2, #0x34]
	mov r1, ip
	ldrb r0, [r1]
	movs r1, #1
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	adds r0, r2, #0
	movs r1, #2
	bl Proc_Goto
	movs r0, #0
	b _080C50E6
	.align 2, 0
_080C50E0: .4byte 0x08AC1FE4
_080C50E4:
	movs r0, #1
_080C50E6:
	pop {r4, r5}
	pop {r1}
	bx r1

