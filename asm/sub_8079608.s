	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80789BC, 0x080789BC + 1
	.set sub_807A468, 0x0807A468 + 1
	.section .text.sub_8079608, "ax", %progbits
@ sub_8079608 @ JP 0x08079608 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8079608
	.thumb_func
sub_8079608:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	ldrh r1, [r0, #0x10]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08079620
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080796D4
_08079620:
	adds r0, r5, #0
	bl sub_8002DE4
	ldr r0, _08079648 @ =0x0884892C
	bl Proc_Find
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	str r0, [r4, #0x44]
	ldr r0, [r5, #0x44]
	cmp r0, #9
	bhi _080796D4
	lsls r0, r0, #2
	ldr r1, _0807964C @ =_08079650
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08079648: .4byte 0x0884892C
_0807964C: .4byte _08079650
_08079650: @ jump table
	.4byte _08079678 @ case 0
	.4byte _080796A4 @ case 1
	.4byte _08079678 @ case 2
	.4byte _080796A4 @ case 3
	.4byte _080796D4 @ case 4
	.4byte _080796D4 @ case 5
	.4byte _080796D4 @ case 6
	.4byte _080796D4 @ case 7
	.4byte _080796D4 @ case 8
	.4byte _08079678 @ case 9
_08079678:
	ldr r0, [r5, #0x5c]
	bl sub_80789BC
	cmp r0, #0
	beq _0807968C
	ldr r0, _08079688 @ =0x080ED6FE
	str r0, [r4, #0x48]
	b _080796D4
	.align 2, 0
_08079688: .4byte 0x080ED6FE
_0807968C:
	ldr r0, _0807969C @ =0x080ED72E
	str r0, [r4, #0x48]
	ldr r0, _080796A0 @ =0x088489B0
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x4c]
	b _080796D4
	.align 2, 0
_0807969C: .4byte 0x080ED72E
_080796A0: .4byte 0x088489B0
_080796A4:
	ldr r0, [r5, #0x5c]
	bl sub_80789BC
	cmp r0, #0
	beq _080796C0
	ldr r0, _080796BC @ =0x080ED714
	str r0, [r4, #0x48]
	ldr r0, [r5, #0x5c]
	bl sub_807A468
	b _080796D4
	.align 2, 0
_080796BC: .4byte 0x080ED714
_080796C0:
	ldr r0, _080796DC @ =0x080ED74C
	str r0, [r4, #0x48]
	ldr r0, _080796E0 @ =0x08848950
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x4c]
	ldr r0, [r5, #0x5c]
	bl sub_807A468
_080796D4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080796DC: .4byte 0x080ED74C
_080796E0: .4byte 0x08848950

