	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80C8CDC, "ax", %progbits
@ sub_80C8CDC @ JP 0x080C8CDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C8CDC
	.thumb_func
sub_80C8CDC:
	push {lr}
	adds r1, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq _080C8D08
	cmp r0, #1
	bgt _080C8CF2
	cmp r0, #0
	beq _080C8CF8
	b _080C8D32
_080C8CF2:
	cmp r0, #2
	beq _080C8D18
	b _080C8D32
_080C8CF8:
	ldr r0, [r1, #0x2c]
	cmp r0, #0
	beq _080C8D28
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
	b _080C8D3A
_080C8D08:
	ldr r0, [r1, #0x2c]
	cmp r0, #0
	beq _080C8D28
	adds r0, r1, #0
	movs r1, #2
	bl Proc_Goto
	b _080C8D3A
_080C8D18:
	ldr r0, [r1, #0x2c]
	cmp r0, #0
	beq _080C8D28
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Goto
	b _080C8D3A
_080C8D28:
	adds r0, r1, #0
	movs r1, #5
	bl Proc_Goto
	b _080C8D3A
_080C8D32:
	adds r0, r1, #0
	movs r1, #5
	bl Proc_Goto
_080C8D3A:
	pop {r0}
	bx r0
	.align 2, 0

