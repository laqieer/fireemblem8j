	.syntax unified
	.section .text.GetItemReachBits, "ax", %progbits
@ GetItemReachBits @ JP 0x08016E7C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetItemReachBits
	.thumb_func
GetItemReachBits:
	push {lr}
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016EA0 @ =0x0885E068
	adds r1, r1, r0
	ldrb r0, [r1, #0x19]
	subs r0, #0x11
	cmp r0, #0x2e
	bhi _08016F88
	lsls r0, r0, #2
	ldr r1, _08016EA4 @ =_08016EA8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08016EA0: .4byte 0x0885E068
_08016EA4: .4byte _08016EA8
_08016EA8: @ jump table
	.4byte _08016F64 @ case 0
	.4byte _08016F68 @ case 1
	.4byte _08016F6C @ case 2
	.4byte _08016F70 @ case 3
	.4byte _08016F88 @ case 4
	.4byte _08016F88 @ case 5
	.4byte _08016F88 @ case 6
	.4byte _08016F88 @ case 7
	.4byte _08016F88 @ case 8
	.4byte _08016F88 @ case 9
	.4byte _08016F88 @ case 10
	.4byte _08016F88 @ case 11
	.4byte _08016F88 @ case 12
	.4byte _08016F88 @ case 13
	.4byte _08016F88 @ case 14
	.4byte _08016F88 @ case 15
	.4byte _08016F88 @ case 16
	.4byte _08016F74 @ case 17
	.4byte _08016F78 @ case 18
	.4byte _08016F88 @ case 19
	.4byte _08016F88 @ case 20
	.4byte _08016F88 @ case 21
	.4byte _08016F88 @ case 22
	.4byte _08016F88 @ case 23
	.4byte _08016F88 @ case 24
	.4byte _08016F88 @ case 25
	.4byte _08016F88 @ case 26
	.4byte _08016F88 @ case 27
	.4byte _08016F88 @ case 28
	.4byte _08016F88 @ case 29
	.4byte _08016F88 @ case 30
	.4byte _08016F88 @ case 31
	.4byte _08016F88 @ case 32
	.4byte _08016F88 @ case 33
	.4byte _08016F7C @ case 34
	.4byte _08016F88 @ case 35
	.4byte _08016F88 @ case 36
	.4byte _08016F88 @ case 37
	.4byte _08016F88 @ case 38
	.4byte _08016F88 @ case 39
	.4byte _08016F88 @ case 40
	.4byte _08016F80 @ case 41
	.4byte _08016F88 @ case 42
	.4byte _08016F88 @ case 43
	.4byte _08016F88 @ case 44
	.4byte _08016F88 @ case 45
	.4byte _08016F84 @ case 46
_08016F64:
	movs r0, #1
	b _08016F8A
_08016F68:
	movs r0, #3
	b _08016F8A
_08016F6C:
	movs r0, #7
	b _08016F8A
_08016F70:
	movs r0, #9
	b _08016F8A
_08016F74:
	movs r0, #2
	b _08016F8A
_08016F78:
	movs r0, #6
	b _08016F8A
_08016F7C:
	movs r0, #4
	b _08016F8A
_08016F80:
	movs r0, #0xc
	b _08016F8A
_08016F84:
	movs r0, #0x14
	b _08016F8A
_08016F88:
	movs r0, #0
_08016F8A:
	pop {r1}
	bx r1
	.align 2, 0

