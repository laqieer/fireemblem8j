	.syntax unified
	.set GetItemIndex, 0x08017294 + 1
	.section .text.sub_8074A4C, "ax", %progbits
@ sub_8074A4C @ JP 0x08074A4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8074A4C
	.thumb_func
sub_8074A4C:
	push {lr}
	cmp r0, #0
	bne _08074A54
	b _08074B80
_08074A54:
	bl GetItemIndex
	subs r0, #0x4b
	cmp r0, #0x41
	bls _08074A60
	b _08074B80
_08074A60:
	lsls r0, r0, #2
	ldr r1, _08074A6C @ =_08074A70
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08074A6C: .4byte _08074A70
_08074A70: @ jump table
	.4byte _08074B78 @ case 0
	.4byte _08074B78 @ case 1
	.4byte _08074B78 @ case 2
	.4byte _08074B78 @ case 3
	.4byte _08074B78 @ case 4
	.4byte _08074B78 @ case 5
	.4byte _08074B7C @ case 6
	.4byte _08074B7C @ case 7
	.4byte _08074B7C @ case 8
	.4byte _08074B80 @ case 9
	.4byte _08074B80 @ case 10
	.4byte _08074B80 @ case 11
	.4byte _08074B78 @ case 12
	.4byte _08074B80 @ case 13
	.4byte _08074B78 @ case 14
	.4byte _08074B80 @ case 15
	.4byte _08074B80 @ case 16
	.4byte _08074B80 @ case 17
	.4byte _08074B80 @ case 18
	.4byte _08074B80 @ case 19
	.4byte _08074B80 @ case 20
	.4byte _08074B80 @ case 21
	.4byte _08074B80 @ case 22
	.4byte _08074B80 @ case 23
	.4byte _08074B80 @ case 24
	.4byte _08074B80 @ case 25
	.4byte _08074B80 @ case 26
	.4byte _08074B80 @ case 27
	.4byte _08074B80 @ case 28
	.4byte _08074B80 @ case 29
	.4byte _08074B80 @ case 30
	.4byte _08074B80 @ case 31
	.4byte _08074B80 @ case 32
	.4byte _08074B80 @ case 33
	.4byte _08074B80 @ case 34
	.4byte _08074B80 @ case 35
	.4byte _08074B80 @ case 36
	.4byte _08074B80 @ case 37
	.4byte _08074B80 @ case 38
	.4byte _08074B80 @ case 39
	.4byte _08074B80 @ case 40
	.4byte _08074B80 @ case 41
	.4byte _08074B80 @ case 42
	.4byte _08074B80 @ case 43
	.4byte _08074B80 @ case 44
	.4byte _08074B80 @ case 45
	.4byte _08074B80 @ case 46
	.4byte _08074B80 @ case 47
	.4byte _08074B80 @ case 48
	.4byte _08074B80 @ case 49
	.4byte _08074B80 @ case 50
	.4byte _08074B80 @ case 51
	.4byte _08074B80 @ case 52
	.4byte _08074B80 @ case 53
	.4byte _08074B80 @ case 54
	.4byte _08074B80 @ case 55
	.4byte _08074B80 @ case 56
	.4byte _08074B80 @ case 57
	.4byte _08074B80 @ case 58
	.4byte _08074B80 @ case 59
	.4byte _08074B80 @ case 60
	.4byte _08074B80 @ case 61
	.4byte _08074B80 @ case 62
	.4byte _08074B80 @ case 63
	.4byte _08074B80 @ case 64
	.4byte _08074B78 @ case 65
_08074B78:
	movs r0, #2
	b _08074B82
_08074B7C:
	movs r0, #1
	b _08074B82
_08074B80:
	movs r0, #0
_08074B82:
	pop {r1}
	bx r1
	.align 2, 0

