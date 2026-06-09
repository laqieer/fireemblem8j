	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80D1F8C, "ax", %progbits
@ sub_80D1F8C @ JP 0x080D1F8C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D1F8C
	.thumb_func
sub_80D1F8C:
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x14]
	ldr r0, [r0, #0x14]
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0
	bne _080D1FA6
	adds r0, r1, #0
	movs r1, #4
	bl Proc_Goto
	b _080D1FBE
_080D1FA6:
	cmp r0, #1
	bne _080D1FB2
	adds r0, r1, #0
	bl sub_8002DE4
	b _080D1FBE
_080D1FB2:
	cmp r0, #2
	bne _080D1FBE
	adds r0, r1, #0
	movs r1, #4
	bl Proc_Goto
_080D1FBE:
	pop {r0}
	bx r0
	.align 2, 0

