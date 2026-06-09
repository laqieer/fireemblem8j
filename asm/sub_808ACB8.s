	.syntax unified
	.section .text.sub_808ACB8, "ax", %progbits
@ sub_808ACB8 @ JP 0x0808ACB8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808ACB8
	.thumb_func
sub_808ACB8:
	push {lr}
	adds r2, r0, #0
	ldr r0, _0808ACD8 @ =0x02003BFC
	ldr r0, [r0, #0xc]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #0xd
	bhi _0808AD8A
	lsls r0, r0, #2
	ldr r1, _0808ACDC @ =_0808ACE0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808ACD8: .4byte 0x02003BFC
_0808ACDC: .4byte _0808ACE0
_0808ACE0: @ jump table
	.4byte _0808AD18 @ case 0
	.4byte _0808AD24 @ case 1
	.4byte _0808AD2E @ case 2
	.4byte _0808AD3C @ case 3
	.4byte _0808AD48 @ case 4
	.4byte _0808AD54 @ case 5
	.4byte _0808AD60 @ case 6
	.4byte _0808AD6C @ case 7
	.4byte _0808AD78 @ case 8
	.4byte _0808AD8A @ case 9
	.4byte _0808AD8A @ case 10
	.4byte _0808AD82 @ case 11
	.4byte _0808AD8A @ case 12
	.4byte _0808AD82 @ case 13
_0808AD18:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _0808AD20 @ =0x000004E7
	b _0808AD88
	.align 2, 0
_0808AD20: .4byte 0x000004E7
_0808AD24:
	adds r1, r2, #0
	adds r1, #0x4c
	movs r0, #0x9d
	lsls r0, r0, #3
	b _0808AD88
_0808AD2E:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _0808AD38 @ =0x000004E9
	b _0808AD88
	.align 2, 0
_0808AD38: .4byte 0x000004E9
_0808AD3C:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _0808AD44 @ =0x000004EB
	b _0808AD88
	.align 2, 0
_0808AD44: .4byte 0x000004EB
_0808AD48:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _0808AD50 @ =0x000004EA
	b _0808AD88
	.align 2, 0
_0808AD50: .4byte 0x000004EA
_0808AD54:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _0808AD5C @ =0x000004ED
	b _0808AD88
	.align 2, 0
_0808AD5C: .4byte 0x000004ED
_0808AD60:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _0808AD68 @ =0x000004EE
	b _0808AD88
	.align 2, 0
_0808AD68: .4byte 0x000004EE
_0808AD6C:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _0808AD74 @ =0x000004EF
	b _0808AD88
	.align 2, 0
_0808AD74: .4byte 0x000004EF
_0808AD78:
	adds r1, r2, #0
	adds r1, #0x4c
	movs r0, #0x9e
	lsls r0, r0, #3
	b _0808AD88
_0808AD82:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _0808AD90 @ =0x000004EC
_0808AD88:
	strh r0, [r1]
_0808AD8A:
	pop {r0}
	bx r0
	.align 2, 0
_0808AD90: .4byte 0x000004EC

