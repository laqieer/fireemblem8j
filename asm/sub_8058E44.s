	.syntax unified
	.set GetItemIndex, 0x08017294 + 1
	.section .text.sub_8058E44, "ax", %progbits
@ sub_8058E44 @ JP 0x08058E44 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8058E44
	.thumb_func
sub_8058E44:
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r1, #0
	bl GetItemIndex
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, _08058E60 @ =0x08904164
	ldrh r1, [r0]
	ldr r3, _08058E64 @ =0x0000FFFF
	b _08058E6C
	.align 2, 0
_08058E60: .4byte 0x08904164
_08058E64: .4byte 0x0000FFFF
_08058E68:
	adds r0, #0x10
	ldrh r1, [r0]
_08058E6C:
	cmp r1, r3
	beq _08058E74
	cmp r1, r2
	bne _08058E68
_08058E74:
	movs r1, #4
	ldrsh r2, [r0, r1]
	cmp r2, #3
	beq _08058E7E
	b _08058FDE
_08058E7E:
	subs r0, r4, #5
	cmp r0, #0x49
	bls _08058E86
	b _08058FDE
_08058E86:
	lsls r0, r0, #2
	ldr r1, _08058E90 @ =_08058E94
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08058E90: .4byte _08058E94
_08058E94: @ jump table
	.4byte _08058FBC @ case 0
	.4byte _08058FBC @ case 1
	.4byte _08058FC4 @ case 2
	.4byte _08058FC8 @ case 3
	.4byte _08058FDE @ case 4
	.4byte _08058FDE @ case 5
	.4byte _08058FDC @ case 6
	.4byte _08058FDC @ case 7
	.4byte _08058FDE @ case 8
	.4byte _08058FDE @ case 9
	.4byte _08058FDE @ case 10
	.4byte _08058FDE @ case 11
	.4byte _08058FDE @ case 12
	.4byte _08058FDE @ case 13
	.4byte _08058FDE @ case 14
	.4byte _08058FDE @ case 15
	.4byte _08058FDE @ case 16
	.4byte _08058FDE @ case 17
	.4byte _08058FDE @ case 18
	.4byte _08058FDE @ case 19
	.4byte _08058FDE @ case 20
	.4byte _08058FDE @ case 21
	.4byte _08058FDE @ case 22
	.4byte _08058FDE @ case 23
	.4byte _08058FDE @ case 24
	.4byte _08058FDE @ case 25
	.4byte _08058FD4 @ case 26
	.4byte _08058FD4 @ case 27
	.4byte _08058FD8 @ case 28
	.4byte _08058FD8 @ case 29
	.4byte _08058FDE @ case 30
	.4byte _08058FDE @ case 31
	.4byte _08058FDE @ case 32
	.4byte _08058FDE @ case 33
	.4byte _08058FDE @ case 34
	.4byte _08058FDE @ case 35
	.4byte _08058FDE @ case 36
	.4byte _08058FDE @ case 37
	.4byte _08058FDE @ case 38
	.4byte _08058FDE @ case 39
	.4byte _08058FDE @ case 40
	.4byte _08058FDE @ case 41
	.4byte _08058FDE @ case 42
	.4byte _08058FDE @ case 43
	.4byte _08058FDE @ case 44
	.4byte _08058FDE @ case 45
	.4byte _08058FDE @ case 46
	.4byte _08058FDE @ case 47
	.4byte _08058FDE @ case 48
	.4byte _08058FDE @ case 49
	.4byte _08058FDE @ case 50
	.4byte _08058FDE @ case 51
	.4byte _08058FDE @ case 52
	.4byte _08058FDE @ case 53
	.4byte _08058FDE @ case 54
	.4byte _08058FDE @ case 55
	.4byte _08058FDE @ case 56
	.4byte _08058FDE @ case 57
	.4byte _08058FDE @ case 58
	.4byte _08058FDE @ case 59
	.4byte _08058FDE @ case 60
	.4byte _08058FDE @ case 61
	.4byte _08058FDE @ case 62
	.4byte _08058FDE @ case 63
	.4byte _08058FDE @ case 64
	.4byte _08058FDE @ case 65
	.4byte _08058FDE @ case 66
	.4byte _08058FCC @ case 67
	.4byte _08058FD0 @ case 68
	.4byte _08058FDE @ case 69
	.4byte _08058FDE @ case 70
	.4byte _08058FDE @ case 71
	.4byte _08058FDE @ case 72
	.4byte _08058FC0 @ case 73
_08058FBC:
	movs r2, #4
	b _08058FDE
_08058FC0:
	movs r2, #5
	b _08058FDE
_08058FC4:
	movs r2, #6
	b _08058FDE
_08058FC8:
	movs r2, #0xd
	b _08058FDE
_08058FCC:
	movs r2, #7
	b _08058FDE
_08058FD0:
	movs r2, #8
	b _08058FDE
_08058FD4:
	movs r2, #9
	b _08058FDE
_08058FD8:
	movs r2, #0xa
	b _08058FDE
_08058FDC:
	movs r2, #0xb
_08058FDE:
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

