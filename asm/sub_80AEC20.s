	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80AEC20, "ax", %progbits
@ sub_80AEC20 @ JP 0x080AEC20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AEC20
	.thumb_func
sub_80AEC20:
	push {lr}
	adds r2, r0, #0
	adds r0, #0x35
	ldrb r0, [r0]
	subs r0, #2
	cmp r0, #0x1e
	bhi _080AECCA
	lsls r0, r0, #2
	ldr r1, _080AEC38 @ =_080AEC3C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AEC38: .4byte _080AEC3C
_080AEC3C: @ jump table
	.4byte _080AECC2 @ case 0
	.4byte _080AECCA @ case 1
	.4byte _080AECC2 @ case 2
	.4byte _080AECCA @ case 3
	.4byte _080AECCA @ case 4
	.4byte _080AECCA @ case 5
	.4byte _080AECC2 @ case 6
	.4byte _080AECCA @ case 7
	.4byte _080AECCA @ case 8
	.4byte _080AECCA @ case 9
	.4byte _080AECCA @ case 10
	.4byte _080AECCA @ case 11
	.4byte _080AECCA @ case 12
	.4byte _080AECCA @ case 13
	.4byte _080AECB8 @ case 14
	.4byte _080AECCA @ case 15
	.4byte _080AECCA @ case 16
	.4byte _080AECCA @ case 17
	.4byte _080AECCA @ case 18
	.4byte _080AECCA @ case 19
	.4byte _080AECCA @ case 20
	.4byte _080AECCA @ case 21
	.4byte _080AECCA @ case 22
	.4byte _080AECCA @ case 23
	.4byte _080AECCA @ case 24
	.4byte _080AECCA @ case 25
	.4byte _080AECCA @ case 26
	.4byte _080AECCA @ case 27
	.4byte _080AECCA @ case 28
	.4byte _080AECCA @ case 29
	.4byte _080AECB8 @ case 30
_080AECB8:
	adds r0, r2, #0
	movs r1, #0xb
	bl Proc_Goto
	b _080AECCA
_080AECC2:
	adds r0, r2, #0
	movs r1, #0xa
	bl Proc_Goto
_080AECCA:
	pop {r0}
	bx r0
	.align 2, 0

