	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_8081070, "ax", %progbits
@ sub_8081070 @ JP 0x08081070 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8081070
	.thumb_func
sub_8081070:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0808109C @ =0x0203E1EC
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	adds r2, r0, #0
	cmp r5, #8
	bhi _08081122
	lsls r0, r5, #2
	ldr r1, _080810A0 @ =_080810A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808109C: .4byte 0x0203E1EC
_080810A0: .4byte _080810A4
_080810A4: @ jump table
	.4byte _080810C8 @ case 0
	.4byte _080810E4 @ case 1
	.4byte _080810EA @ case 2
	.4byte _080810F0 @ case 3
	.4byte _080810F6 @ case 4
	.4byte _080810FC @ case 5
	.4byte _08081102 @ case 6
	.4byte _08081108 @ case 7
	.4byte _0808110E @ case 8
_080810C8:
	ldr r1, _080810E0 @ =0x0203E1EC
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0x70
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08081124
	.align 2, 0
_080810E0: .4byte 0x0203E1EC
_080810E4:
	movs r0, #0x12
	ldrsb r0, [r2, r0]
	b _08081124
_080810EA:
	movs r0, #0x14
	ldrsb r0, [r2, r0]
	b _08081124
_080810F0:
	movs r0, #0x15
	ldrsb r0, [r2, r0]
	b _08081124
_080810F6:
	movs r0, #0x16
	ldrsb r0, [r2, r0]
	b _08081124
_080810FC:
	movs r0, #0x19
	ldrsb r0, [r2, r0]
	b _08081124
_08081102:
	movs r0, #0x17
	ldrsb r0, [r2, r0]
	b _08081124
_08081108:
	movs r0, #0x18
	ldrsb r0, [r2, r0]
	b _08081124
_0808110E:
	ldr r0, [r2, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r2]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	b _08081124
_08081122:
	movs r0, #0
_08081124:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

