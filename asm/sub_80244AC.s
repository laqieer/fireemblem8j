	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_80244AC, "ax", %progbits
@ sub_80244AC @ JP 0x080244AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80244AC
	.thumb_func
sub_80244AC:
	push {r4, r5, lr}
	ldr r0, _080244C8 @ =0x03004DF0
	ldr r1, [r0]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x66
	bne _080244C4
	ldr r0, [r1, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080244CC
_080244C4:
	movs r0, #3
	b _080244F2
	.align 2, 0
_080244C8: .4byte 0x03004DF0
_080244CC:
	movs r5, #0
	movs r4, #0x81
_080244D0:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _080244EA
	ldr r0, [r0]
	cmp r0, #0
	beq _080244EA
	cmp r5, #0x27
	bhi _080244C4
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_080244EA:
	adds r4, #1
	cmp r4, #0xbf
	ble _080244D0
	movs r0, #1
_080244F2:
	pop {r4, r5}
	pop {r1}
	bx r1

