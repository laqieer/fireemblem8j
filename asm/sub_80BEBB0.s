	.syntax unified
	.set NewGmapTimeMons, 0x080C6830 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set WmShowMonsters, 0x080C68B4 + 1
	.section .text.sub_80BEBB0, "ax", %progbits
@ sub_80BEBB0 @ JP 0x080BEBB0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BEBB0
	.thumb_func
sub_80BEBB0:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r5, #0
	ldr r3, _080BEBD8 @ =0x03005270
	ldrb r1, [r3]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080BEC2A
	ldr r0, _080BEBDC @ =0x0202BCEC
	ldrb r1, [r0, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080BEBF6
	movs r2, #4
	adds r1, r3, #0
	adds r1, #0x10
	b _080BEBE8
	.align 2, 0
_080BEBD8: .4byte 0x03005270
_080BEBDC: .4byte 0x0202BCEC
_080BEBE0:
	adds r1, #4
	adds r2, #1
	cmp r2, #6
	bgt _080BEBF0
_080BEBE8:
	movs r3, #0x12
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _080BEBE0
_080BEBF0:
	cmp r2, #7
	bne _080BEC26
	b _080BEC2A
_080BEBF6:
	ldrb r0, [r3, #0x11]
	lsls r0, r0, #5
	ldr r1, _080BEC0C @ =0x081F5D7C
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #3
	bne _080BEC26
	movs r2, #4
	adds r1, r3, #0
	adds r1, #0x10
	b _080BEC18
	.align 2, 0
_080BEC0C: .4byte 0x081F5D7C
_080BEC10:
	adds r1, #4
	adds r2, #1
	cmp r2, #6
	bgt _080BEC20
_080BEC18:
	movs r3, #0x12
	ldrsh r0, [r1, r3]
	cmp r0, #0
	beq _080BEC10
_080BEC20:
	cmp r2, #7
	bne _080BEC26
	movs r5, #1
_080BEC26:
	cmp r5, #0
	beq _080BEC40
_080BEC2A:
	movs r0, #0
	mov r1, sp
	bl NewGmapTimeMons
	ldr r0, [sp]
	cmp r0, #0
	ble _080BEC40
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_080BEC40:
	bl WmShowMonsters
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

