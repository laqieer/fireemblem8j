	.syntax unified
	.set EndMenuScrollBar, 0x08099968 + 1
	.set Proc_EndEach, 0x08002FC8 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8089078, 0x08089078 + 1
	.set sub_809442C, 0x0809442C + 1
	.section .text.sub_80B707C, "ax", %progbits
@ sub_80B707C @ JP 0x080B707C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B707C
	.thumb_func
sub_80B707C:
	push {r4, lr}
	adds r4, r0, #0
	bl EndMenuScrollBar
	bl sub_8089078
	ldr r0, _080B70A4 @ =0x08AAFA0C
	bl Proc_EndEach
	ldr r0, _080B70A8 @ =0x08AAF9EC
	bl Proc_EndEach
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #0
	bne _080B70AC
	movs r0, #1
	b _080B70BC
	.align 2, 0
_080B70A4: .4byte 0x08AAFA0C
_080B70A8: .4byte 0x08AAF9EC
_080B70AC:
	adds r0, r4, #0
	bl sub_809442C
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	movs r0, #0
_080B70BC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

