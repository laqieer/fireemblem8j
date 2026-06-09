	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80D1344, "ax", %progbits
@ sub_80D1344 @ JP 0x080D1344 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D1344
	.thumb_func
sub_80D1344:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x14]
	adds r0, r1, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0
	bne _080D1380
	adds r5, r1, #0
	adds r5, #0x34
	ldrb r0, [r5]
	cmp r0, #0
	bne _080D1372
	adds r0, r1, #0
	adds r0, #0x35
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x3b
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
_080D1372:
	ldrb r0, [r5]
	cmp r0, #1
	bne _080D1380
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
_080D1380:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

